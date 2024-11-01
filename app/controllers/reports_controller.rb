require "json"
require_relative "../../config/database"
require_relative "../models/reports"

class ReportsController

  def index(req)
    reports = Report.all
    response_body = {db_reports: reports}.to_json
    [200, {"Content-Type" => "application/json"}, [response_body]]
  end

  def create(req)
    body = JSON.parse(req.body.read)

    report_created = Report.new(body)
    result = report_created.save

    response_body = {report_creado: result}.to_json
    [200, {"Content-Type" => "application/json"}, [response_body]]
  end

  def show(req,id)
    begin
      report_found = find_report(id)
      response_body = {report: report_found}.to_json
      [200, {"Content-Type" => "application/json"}, [response_body]]
    rescue ArgumentError => e
      [404, {"Content-Type" => "application/json"}, [message: e.message]]
    end

  end

  def update(req,id)
    body = JSON.parse(req.body.read)
    report_found = find_report(id)
    report_updated = report_found.update(body)
    response_body = {report_actualizado: report_updated}.to_json
    [200, {"Content-Type" => "application/json"}, [response_body]]
  end

  def destroy(req,id)
    report_found = find_report(id)
    result = report_found.destroy
    response_body = {report_eliminado: result}.to_json
    [200, {"Content-Type" => "application/json"}, [response_body]]
  end

  def find_report(id)
    Report.find(id)
  end
end
