-- remap `v` extension to verilog,
-- otherwise nvim recognizes it as `vlang`
vim.filetype.add {
  extension = {
    v = "verilog"
  }
}
