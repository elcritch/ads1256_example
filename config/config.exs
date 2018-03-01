# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :nerves_init_gadget,
  ifname: "eth0",
  address_method: :dhcp,
  mdns_domain: "nerves-rpi3.local",
  node_name: nil,
  node_host: :mdns_domain

config :shoehorn,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

config :nerves_firmware_ssh,
  authorized_keys: [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNnURXeZ846e2KLM6IEePF8U5F5C58bDMdCCWdlJi189ISKUsfA8i9GIm+2y2H0PAYL2NrW3Ey+9cfALMLIGQGDeWpLWd/VkNr/eAVJ/8mEreNeRbWYfLHWRIfk4qLWt5fXlkfiEywLYetZBJXdoa9F/2NlMZX1kbKNEVQD0gREaQaOnRNSimHDPzMficiJcdlFT1Jdu+cxjleto0rEwiBJhWf5EygTlDaB5PN1CLt7b2tBhmyfHPw4etBGfAvL8Dyl0a+xVh64YEyO7LfXyDQOXJaidtcH3Abc/N4IiJXHSqxipqao64Tzi9mgTn6D84DatuOYfabSl3WLDGHJSka5LIPU+y36YovpgeKvYVTU4O/2kyBoSd8kaTL6uXD0oSCnrEHThHLTcrSzuCjMIM1dCXN+G6bhW47chOEHfw3G0ZnY/SyR/7S5xQ0FZwJf0ub++Scf//yaOECMViAn+1T/qBsJNMKeRcv3fPFeMdkO8mWD+qpHaJD1nmVvZD+UVhqmTou5WhKFiIqc3v1+WZ7SXIlWqIchWsje84LOqeLyylnyKYqkVKGDIHOLAWR5WEgPXtKm0hfBwPqlfit12vuqLpYL1Er3o+E45Hb1b6VHyt/Yo86A3XlQ1V1ETkJMXWAeRM1Ne5OQuKG9jyP/p+rvbn04kqjY+LPeysSgr9KrQ=="
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
