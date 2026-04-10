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
Updated: 2026-04-10T10:02:56.987194+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.184 | 4471 |
| us-east-2 | 0.160 | 1489 |
| us-gov-east-1 | 0.174 | 1638 |
| us-gov-west-1 | 0.198 | 192 |
| us-west-1 | 0.136 | 3387 |
| us-west-2 | 0.192 | 154 |

