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
Updated: 2026-03-12T18:42:35.514594+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.190 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.535 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.856 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.190 | 4270 |
| us-east-2 | 0.162 | 1421 |
| us-gov-east-1 | 0.164 | 1565 |
| us-gov-west-1 | 0.165 | 180 |
| us-west-1 | 0.136 | 3215 |
| us-west-2 | 0.165 | 144 |

