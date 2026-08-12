// This file is part of Moodle - http://moodle.org/ //
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
 * Course gallery content handler.
 *
 * @module     block_pimenkofeaturedcourses/content
 * @copyright  2026 Pimenko <pimenko.com>
 * @author     Revenu Sylvain <support@pimenko.com> | Amine NEDJAR <a.nedjar@pimenko.com>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

let geoPatternLib = null;

const generatePictures = courseGallery => {
    if (!geoPatternLib) {
        return;
    }

    for (let i = 0; i < courseGallery.length; i++) {
        const card = courseGallery.item(i);
        if (!card) {
            continue;
        }
        const id = card.id;
        const img = card.getElementsByClassName('img-course').item(0);
        if (img && img.style['background-image'] == 'url("")') {
            const pattern = geoPatternLib.generate(id);
            img.style['background-image'] = pattern.toDataUrl();
        }
    }
};

const refreshGallery = () => {
    const courseGallery = document.getElementsByClassName('course-gallery');
    if (courseGallery.length > 0) {
        generatePictures(courseGallery);
    }
};

export const init = () => {
    const gpUrl = M.cfg.wwwroot + '/blocks/pimenkofeaturedcourses/javascript/geopattern/js/geopattern.min.js';
    require([gpUrl], GeoPatternModule => {
        geoPatternLib = GeoPatternModule || window.GeoPattern || null;

        refreshGallery();

        const galleryRoot = document.getElementById('course-gallery');
        if (!galleryRoot || !galleryRoot.parentElement) {
            return;
        }

        const observer = new MutationObserver(() => {
            refreshGallery();
        });
        observer.observe(galleryRoot.parentElement, { attributes: false, childList: true, subtree: true });
    });
};
