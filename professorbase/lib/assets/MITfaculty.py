import scrapy

class MITCSSpider(scrapy.Spider):
    name = 'mit_cs'
    start_urls = ['https://www.eecs.mit.edu/people/faculty-advisors/17',
                  'https://www.eecs.mit.edu/people/faculty-advisors/34',
                  'https://www.eecs.mit.edu/people/faculty-advisors/32',
                  'https://www.eecs.mit.edu/people/faculty-advisors/35']

    def parse(self, response):
        for href in response.css('.faculty-list .card-title a::attr(href)'):
            full_url = response.urljoin(href.extract())
            if 'http://www.csail.mit.edu/user/' in full_url:
                yield scrapy.Request(full_url, callback=self.parse_profile)

    def parse_profile(self, response):
        yield {
            'name': response.xpath('//h1[contains(@class,"title")]/text()').extract()[0][1:],
            'title': response.xpath('//ul[contains(@class,"profileList")]/li[2]/text()').extract()[0].replace('Position: ',''),
            'phone': response.xpath('//ul[contains(@class,"profileList")]/li[4]/text()').extract()[0].replace('Phone: ',''),
            'email': response.xpath('//ul[contains(@class,"profileList")]/li[5]/text()').extract()[0].replace('Email: ',''),
            'study_areas': response.xpath('//ul[contains(@class,"profileList")]/li[6]/text()').extract()[0].replace('Areas of Study: ','').split(', '),
            'website': response.xpath('//ul[contains(@class,"profileList")]/a[1]/@href').extract()[0],
            'bio': " ".join(response.xpath('//table[contains(@class,"profile")]//td[@style="padding-right: 40px;"]/node()').extract()[3:]),
            'publications': response.xpath('//table[contains(@class,"profile")]//div[@style="width:300px;"]/ul[1]/li/text()').extract(),
            # 'picture_url': response.urljoin(response.xpath('//table[contains(@class,"profile")]//img[contains(@class,"profilePicture")]/@src').extract()[0]),
            'profile_link': response.url,
        }