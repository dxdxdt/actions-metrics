# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-05-07T05:54:27.448652+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.069 | 4606 |
| us-east-2 | 0.084 | 1570 |
| us-gov-east-1 | 0.082 | 1679 |
| us-gov-west-1 | 0.292 | 194 |
| us-west-1 | 0.231 | 3536 |
| us-west-2 | 0.302 | 157 |

