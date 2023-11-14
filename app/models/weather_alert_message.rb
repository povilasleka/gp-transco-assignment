
class WeatherAlertMessage
    include ActiveModel::Serialization

    attr_accessor :area_desc, :headline, :description, :instruction, :effective, :expires, :severity

    def initialize(attributes = {})
        self.area_desc = attributes["areaDesc"]
        self.headline = attributes["headline"]
        self.description = attributes["description"]
        self.instruction = attributes["instruction"]
        self.effective = attributes["effective"]
        self.expires = attributes["expires"]
        self.severity = attributes["severity"]
    end

    def attributes
        {
            area_desc: area_desc,
            headline: headline,
            description: description,
            instruction: instruction,
            effective: effective,
            expires: expires,
            severity: severity,
        }
    end

    def expired?
        Time.parse(expires) <= Time.now
    end
end