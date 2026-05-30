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
Updated: 2026-05-30T21:54:04.582785+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.498 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.138 | 4702 |
| us-east-2 | 0.119 | 1615 |
| us-gov-east-1 | 0.126 | 1708 |
| us-gov-west-1 | 0.213 | 195 |
| us-west-1 | 0.168 | 3623 |
| us-west-2 | 0.218 | 161 |

