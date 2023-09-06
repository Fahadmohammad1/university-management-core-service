/*
  Warnings:

  - The primary key for the `student_semester_registration_courses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `offeredCourseId` to the `student_semester_registration_courses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "student_semester_registration_courses" DROP CONSTRAINT "student_semester_registration_courses_pkey",
ADD COLUMN     "offeredCourseId" TEXT NOT NULL,
ADD CONSTRAINT "student_semester_registration_courses_pkey" PRIMARY KEY ("semesterRegistrationId", "studentId", "offeredCourseId");

-- AddForeignKey
ALTER TABLE "student_semester_registration_courses" ADD CONSTRAINT "student_semester_registration_courses_semesterRegistration_fkey" FOREIGN KEY ("semesterRegistrationId") REFERENCES "semester_registrations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_semester_registration_courses" ADD CONSTRAINT "student_semester_registration_courses_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_semester_registration_courses" ADD CONSTRAINT "student_semester_registration_courses_offeredCourseId_fkey" FOREIGN KEY ("offeredCourseId") REFERENCES "offered_courses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_semester_registration_courses" ADD CONSTRAINT "student_semester_registration_courses_offeredCourseSection_fkey" FOREIGN KEY ("offeredCourseSectionId") REFERENCES "offered_course_sections"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
