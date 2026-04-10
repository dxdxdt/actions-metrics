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
Updated: 2026-04-10T18:41:50.284929+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.617 |  |
| ap-southeast-3 | 0.784 |  |
| ap-southeast-4 | 0.656 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.822 |  |
| ca-central-1 | 0.277 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.578 |  |
| eu-north-1 | 0.634 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.491 |  |
| eu-west-2 | 0.527 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.944 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.226 | 4472 |
| us-east-2 | 0.183 | 1491 |
| us-gov-east-1 | 0.194 | 1638 |
| us-gov-west-1 | 0.138 | 192 |
| us-west-1 | 0.086 | 3390 |
| us-west-2 | 0.134 | 155 |

