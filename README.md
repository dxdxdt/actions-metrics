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
Updated: 2026-09-20T08:08:52.380267+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.587 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.848 |  |
| ca-central-1 | 0.236 | 18 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.183 | 5109 |
| us-east-2 | 0.210 | 1686 |
| us-gov-east-1 | 0.200 | 1920 |
| us-gov-west-1 | 0.184 | 234 |
| us-west-1 | 0.117 | 4128 |
| us-west-2 | 0.187 | 192 |

