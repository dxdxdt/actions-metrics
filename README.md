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
Updated: 2026-08-16T14:15:05.318958+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.650 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.241 | 18 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.886 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.671 |  |
| us-east-1 | 0.203 | 5008 |
| us-east-2 | 0.211 | 1679 |
| us-gov-east-1 | 0.200 | 1834 |
| us-gov-west-1 | 0.140 | 224 |
| us-west-1 | 0.152 | 3964 |
| us-west-2 | 0.142 | 180 |

