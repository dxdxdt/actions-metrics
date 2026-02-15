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
Updated: 2026-02-15T07:33:50.394510+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.677 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.187 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.814 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.565 |  |
| us-east-1 | 0.126 | 4123 |
| us-east-2 | 0.136 | 1341 |
| us-gov-east-1 | 0.140 | 1470 |
| us-gov-west-1 | 0.242 | 148 |
| us-west-1 | 0.198 | 3062 |
| us-west-2 | 0.245 | 125 |

