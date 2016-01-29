import scrapy
import re

# scrapy runspider yalefaculty.py -o yalecs.json

class YaleCSSpider(scrapy.Spider):
    name = 'yale_cs'
    start_urls = ['http://cpsc.yale.edu/people/faculty']

    def parse(self, response):
        for href in response.css('a.username::attr(href)'):
            full_url = response.urljoin(href.extract())
            yield scrapy.Request(full_url, callback=self.parse_profile)

    def parse_profile(self, response):
        yield {
            'name': re.search(r'people/(\w+-\w+)',response.url).group(1).replace('-',' ').title(),
            'title': response.css('.field-name-field-title .field-items .field-item::text').extract()[0],
            'address': response.css('.field-name-field-address .field-items .field-item::text').extract()[0],
            'phone': response.css('.field-name-field-phone .field-items .field-item::text').extract()[0] if response.css('.field-name-field-phone .field-items .field-item::text') else "",            'email': response.css('.field-name-field-email .field-items .field-item a::text').extract()[0],
            'website': response.css('.field-name-field-website .field-items .field-item a::attr(href)').extract()[0] if response.css('.field-name-field-website .field-items .field-item a::attr(href)') else "",
            'bio': " ".join(response.xpath('//div[contains(@class,"field-name-field-bio")]//p')[:response.xpath('//div[contains(@class,"field-name-field-bio")]//p').extract().index('<p>Representative Publications:</p>')].extract() if '<p>Representative Publications:</p>' in response.xpath('//div[contains(@class,"field-name-field-bio")]//p').extract() else response.xpath('//div[contains(@class,"field-name-field-bio")]//p')[:response.xpath('//div[contains(@class,"field-name-field-bio")]//p').extract().index('<p>Representative Publications</p>')].extract()),
            'publications':response.xpath('//div[contains(@class,"field-name-field-bio")]//p')[response.xpath('//div[contains(@class,"field-name-field-bio")]//p').extract().index('<p>Representative Publications:</p>')+1:].extract() if '<p>Representative Publications:</p>' in response.xpath('//div[contains(@class,"field-name-field-bio")]//p').extract() else [i+j for i,j in zip(response.xpath('//div[contains(@class,"field-name-field-bio")]//li//text()').extract()[::2], response.xpath('//div[contains(@class,"field-name-field-bio")]//li//text()').extract()[1::2])],
            'profile_link': response.url,
        }