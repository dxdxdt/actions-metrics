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
Updated: 2026-03-04T07:33:54.845963+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.161 |  |
| eu-central-1 | 0.537 |  |
| eu-central-2 | 0.561 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.563 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.533 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.875 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.647 |  |
| us-east-1 | 0.205 | 4215 |
| us-east-2 | 0.171 | 1397 |
| us-gov-east-1 | 0.168 | 1528 |
| us-gov-west-1 | 0.144 | 169 |
| us-west-1 | 0.166 | 3168 |
| us-west-2 | 0.141 | 140 |

