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
Updated: 2026-05-24T19:06:01.984520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.862 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.084 | 4686 |
| us-east-2 | 0.113 | 1611 |
| us-gov-east-1 | 0.115 | 1704 |
| us-gov-west-1 | 0.290 | 195 |
| us-west-1 | 0.245 | 3594 |
| us-west-2 | 0.290 | 160 |

