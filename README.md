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
Updated: 2026-07-29T19:01:10.669121+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.767 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.138 | 17 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.092 | 4920 |
| us-east-2 | 0.072 | 1670 |
| us-gov-east-1 | 0.069 | 1785 |
| us-gov-west-1 | 0.258 | 207 |
| us-west-1 | 0.204 | 3853 |
| us-west-2 | 0.257 | 171 |

