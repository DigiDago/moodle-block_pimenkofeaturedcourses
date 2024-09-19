<?php

namespace block_pimenkofeaturedcourses\output;

defined('MOODLE_INTERNAL') || die;

// You may want to include additional libraries or files as needed, such as the renderers or classes you're using in your get_content method.

class mobile {

    public static function view_hello() {
        return [
            'templates' => [
                [
                    'id' => 'main',
                    'html' => '<h1 class="text-center">{{ "plugin.block_pimenkofeaturedcourses.hello" | translate }}</h1>',
                ],
            ],
        ];
    }
}
