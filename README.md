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
Updated: 2026-09-19T05:21:24.631416+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.686 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.221 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.650 |  |
| us-east-1 | 0.187 | 5105 |
| us-east-2 | 0.190 | 1686 |
| us-gov-east-1 | 0.165 | 1918 |
| us-gov-west-1 | 0.163 | 234 |
| us-west-1 | 0.104 | 4126 |
| us-west-2 | 0.164 | 192 |

