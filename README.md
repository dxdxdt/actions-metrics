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
Updated: 2026-05-18T11:00:23.624684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.060 |  |
| ap-east-1 | 0.650 |  |
| ap-east-2 | 0.574 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.488 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.719 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.736 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.293 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.586 |  |
| eu-central-2 | 0.597 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.607 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.554 |  |
| il-central-1 | 0.744 |  |
| me-central-1 | 0.960 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.694 |  |
| us-east-1 | 0.248 | 4659 |
| us-east-2 | 0.226 | 1599 |
| us-gov-east-1 | 0.243 | 1697 |
| us-gov-west-1 | 0.122 | 195 |
| us-west-1 | 0.062 | 3576 |
| us-west-2 | 0.120 | 158 |

