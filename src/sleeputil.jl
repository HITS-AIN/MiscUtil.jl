function tasksleep(;id=id::Int, workfor::Int=workfor, sleepfor::Int=sleepfor)

    stopcmd   = `kill -STOP $id`

    resumecmd = `kill -CONT $id`

    sleep(workfor)

    while true

        run(resumecmd)

        for i in 0:workfor-1
            local msg = @sprintf("\rProcess %d is working for %d seconds  😴", id, workfor-i)
            print(Crayon(foreground = :green,  bold = true), @sprintf("%s",msg), Crayon(reset = true))
            sleep(1)
        end


        run(stopcmd)

        for i in 0:sleepfor-1
            local msg = @sprintf("\rProcess %d is sleeping for %d seconds 🙂", id, sleepfor-i)
            print(Crayon(foreground = :light_red,  bold = true), @sprintf("%s",msg), Crayon(reset = true))
            sleep(1)

        end

    end

end
