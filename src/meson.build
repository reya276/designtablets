designtablets_sources = [
  'main.vala',
  'window.vala',
]

designtablets_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

designtablets_sources += gnome.compile_resources('designtablets-resources',
  'designtablets.gresource.xml',
  c_name: 'designtablets'
)

executable('designtablets', designtablets_sources,
  vala_args: '--target-glib=2.50',
  dependencies: designtablets_deps,
  install: true,
)
