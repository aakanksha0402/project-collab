module DashboardHelper

  def list_report(text, options)
    content_tag :div, class: "col-md-12" do
      content_tag :div, class: "card" do
        content_tag :div, class: "content table-responsive" do
          safe_join([header(text), table(options)])
        end
      end
    end
  end

  def header(text)
    content_tag :div, class: "header" do
      content_tag(:h4, text, class: "title")
    end
  end

  def table(options)
    content_tag(:table, table_body(options))
  end

  def table_body(options)
    columns = options[:collection]
    statuses = options[:status]

    thead = content_tag :thead do
     content_tag :tr do
       concat content_tag(:th, "Status")
       columns.collect {|column| concat content_tag(:th, column.try(:email) || column.name)}.join().html_safe
     end
   end

   tbody = content_tag :tbody do
    statuses.collect { |status|
      content_tag :tr do
        concat content_tag(:td, status.humanize)
        columns.collect { |column|
          tasks = column.get_tasks_by_status(status)
          concat content_tag(:td, reasons_list(tasks))
        }.join().html_safe
      end
    }.join().html_safe
   end

   content_tag :table, thead.concat(tbody), class: "table table-striped"
  end

  def reasons_list(list)
    list = list.map { |list| list_item(list) }
    content_tag(:ul, safe_join(list))
  end

  def list_item(list)
    content_tag(:li, list.name)
  end
end
