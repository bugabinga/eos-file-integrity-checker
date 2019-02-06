project('net.bugabinga.eos.FileIntegrity', ['vala', 'c'],
    version: '0.1',
    license: 'GPL3+'
)

i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')

executable(
    meson.project_name(),
    'src/FileIntegrity.vala',
    'src/WelcomeView.vala',
    'src/AppState.vala',
    /* dependencies: [ */
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install: true
)

i18n.merge_file(
    input: join_paths('data', meson.project_name()+'.desktop.in'),
    output: meson.project_name()+'.desktop',
    po_dir: join_paths(meson.source_root(),'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'),'applications')
)

i18n.merge_file(
    input: join_paths('data', meson.project_name()+'.appdata.xml.in'),
    output: meson.project_name()+'.appdata.xml',
    po_dir: join_paths(meson.source_root(),'po'),
    type: 'xml',
    install: true,
    install_dir: join_paths(get_option('datadir'),'metainfo')
)

subdir('po')
