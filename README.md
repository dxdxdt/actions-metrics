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
Updated: 2026-08-21T08:30:08.901813+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.988 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.146 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.826 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.124 | 5035 |
| us-east-2 | 0.126 | 1680 |
| us-gov-east-1 | 0.110 | 1865 |
| us-gov-west-1 | 0.236 | 224 |
| us-west-1 | 0.172 | 4009 |
| us-west-2 | 0.236 | 184 |

