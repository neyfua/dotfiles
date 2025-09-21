function fish_prompt
          set_color -b 26233a
          set_color e0def4
          printf " %s " (prompt_pwd)
          set_color normal
          printf " "
      end
