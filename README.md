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
Updated: 2026-07-25T11:58:35.693391+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.580 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.500 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.199 | 4906 |
| us-east-2 | 0.164 | 1664 |
| us-gov-east-1 | 0.170 | 1777 |
| us-gov-west-1 | 0.165 | 207 |
| us-west-1 | 0.114 | 3830 |
| us-west-2 | 0.167 | 170 |

