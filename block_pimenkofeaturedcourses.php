<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Block definition class for the block_pimenkofeaturedcourses plugin.
 *
 * @package   block_pimenkofeaturedcourses
 * @copyright Pimenko | Sylvain Revenu
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

class block_pimenkofeaturedcourses extends block_base {

    /**
     * Initialises the block.
     *
     * @return void
     */
    public function init(): void {
        $this->title = get_string('pimenkofeaturedcourses', 'block_pimenkofeaturedcourses');
    }

    /**
     * Gets the block contents.
     *
     * @return string The block HTML.
     */
    public function get_content() {
        global $OUTPUT;

        if ($this->content !== null) {
            return $this->content;
        }

        $this->content = new stdClass();
        $this->content->footer = '';

        // Add logic here to define your template data or any other content.
        $data = ['YOUR DATA GOES HERE'];

        $this->content->text = $OUTPUT->render_from_template('block_pimenkofeaturedcourses/template/content', $data);

        return $this->content;
    }

    /**
     * Defines in which pages this block can be added.
     *
     * @return array of the pages where the block can be added.
     */
    public function applicable_formats(): array {
        return [
            'admin' => true,
            'site-index' => true,
            'course-view' => true,
            'mod' => true,
            'my' => true,
        ];
    }
}
