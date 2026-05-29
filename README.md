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
Updated: 2026-05-29T21:47:39.913399+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.743 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.946 |  |
| ap-southeast-4 | 0.832 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.385 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.505 |  |
| us-east-1 | 0.065 | 4699 |
| us-east-2 | 0.076 | 1614 |
| us-gov-east-1 | 0.087 | 1708 |
| us-gov-west-1 | 0.309 | 195 |
| us-west-1 | 0.247 | 3615 |
| us-west-2 | 0.312 | 161 |

