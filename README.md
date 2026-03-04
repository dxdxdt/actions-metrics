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
Updated: 2026-03-04T12:38:30.270474+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.457 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.710 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.768 |  |
| ap-southeast-4 | 0.632 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.817 |  |
| ca-central-1 | 0.296 | 16 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.593 |  |
| eu-central-2 | 0.606 |  |
| eu-north-1 | 0.638 |  |
| eu-south-1 | 0.627 |  |
| eu-south-2 | 0.635 |  |
| eu-west-1 | 0.512 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.558 |  |
| il-central-1 | 0.765 |  |
| me-central-1 | 0.978 |  |
| me-south-1 | 0.935 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.264 | 4216 |
| us-east-2 | 0.216 | 1397 |
| us-gov-east-1 | 0.216 | 1529 |
| us-gov-west-1 | 0.114 | 169 |
| us-west-1 | 0.071 | 3171 |
| us-west-2 | 0.118 | 140 |

