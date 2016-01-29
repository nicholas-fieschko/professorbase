import scrapy

class HarvardCSSpider(scrapy.Spider):
    name = 'harvard_cs'
    start_urls = ['https://www.seas.harvard.edu/computer-science/people']

    def parse(self, response):
        for href in response.css('.field-content h2 a::attr(href)')[::2]:
            full_url = response.urljoin(href.extract())
            yield scrapy.Request(full_url, callback=self.parse_profile)

    def parse_profile(self, response):
        phone = response.xpath('//table[@id="profilecontact"]//tr/td[text()="Office Phone:"]/following-sibling::td/text()').extract()
        website = response.xpath('//h3[contains(@class,"views-label-field-website")]/following-sibling::div//div[contains(@class,"item-list")]//li[contains(@class,"first")]/a/@href').extract()
        address = response.xpath('//table[@id="profilecontact"]//tr/td[text()="Office:"]/following-sibling::td/text()').extract()
        yield {
            'name': response.css('.view-content .views-field-title h1.field-content::text').extract()[0],
            'title': response.css('.view-content .views-field-field-primary-title .field-content li::text').extract()[0],
            'email': response.css('#profilecontact a::attr(href)').extract()[0].replace('mailto:',''),
            'website': website[0] if website else '',
            'phone': phone[0] if phone else '',
            'address': address[0] if address else '',
            'study_areas': response.xpath('//div[contains(@class,"view-footer")]//div[contains(@class,"item-list")]/ul//div[contains(@class,"views-field-name")]/span/text()').extract(),
            'bio': " ".join(response.xpath('//div[contains(@class,"views-field-field-biography")]//p/text()').extract()),
            'profile_link': response.url,
        }