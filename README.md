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
Updated: 2026-08-10T12:50:15.726592+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.695 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.173 | 18 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.122 | 4967 |
| us-east-2 | 0.134 | 1678 |
| us-gov-east-1 | 0.149 | 1816 |
| us-gov-west-1 | 0.247 | 216 |
| us-west-1 | 0.203 | 3916 |
| us-west-2 | 0.243 | 176 |

