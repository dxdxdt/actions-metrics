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
Updated: 2026-07-11T09:19:52.535551+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.649 |  |
| ap-east-2 | 0.583 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.569 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.831 |  |
| ca-central-1 | 0.279 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.651 |  |
| us-east-1 | 0.213 | 4847 |
| us-east-2 | 0.221 | 1656 |
| us-gov-east-1 | 0.205 | 1735 |
| us-gov-west-1 | 0.156 | 202 |
| us-west-1 | 0.118 | 3765 |
| us-west-2 | 0.154 | 165 |

