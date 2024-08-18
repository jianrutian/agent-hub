# arxiv_hunting/fetching/fetcher.py

import requests
import xml.etree.ElementTree as ET
import yaml

class PaperFetcher:
    def __init__(self, config_path="config/config.yaml"):
        # Load configuration
        with open(config_path, 'r') as file:
            self.config = yaml.safe_load(file)
    
    def fetch_latest_papers(self, query):
        # Construct the request URL
        url = f"{self.config['arxiv']['base_url']}?search_query={query}&start=0&max_results={self.config['arxiv']['max_results']}"
        response = requests.get(url)
        
        if response.status_code == 200:
            return self.parse_papers(response.content)
        else:
            print(f"Failed to fetch papers: {response.status_code}")
            return []
    
    def parse_papers(self, xml_data):
        # Parse the XML data
        root = ET.fromstring(xml_data)
        papers = []
        
        for entry in root.findall('{http://www.w3.org/2005/Atom}entry'):
            paper = {
                'title': entry.find('{http://www.w3.org/2005/Atom}title').text,
                'summary': entry.find('{http://www.w3.org/2005/Atom}summary').text,
                'published': entry.find('{http://www.w3.org/2005/Atom}published').text,
                'link': entry.find('{http://www.w3.org/2005/Atom}link').attrib['href']
            }
            papers.append(paper)
        
        return papers

