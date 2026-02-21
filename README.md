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
Updated: 2026-02-21T04:00:28.205359+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.505 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.173 | 4156 |
| us-east-2 | 0.161 | 1359 |
| us-gov-east-1 | 0.167 | 1495 |
| us-gov-west-1 | 0.181 | 160 |
| us-west-1 | 0.140 | 3089 |
| us-west-2 | 0.186 | 129 |

