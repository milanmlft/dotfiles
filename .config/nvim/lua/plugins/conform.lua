local sql_ft = { "sql", "mysql", "plsql" }

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    opts.formatters.sqlfluff = {
      args = { "format", "--dialect=ansi", "-" },
    }
    for _, ft in ipairs(sql_ft) do
      opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      table.insert(opts.formatters_by_ft[ft], "sqlfluff")
    end
  end,
}
