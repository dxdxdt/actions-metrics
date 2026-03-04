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
Updated: 2026-03-04T17:33:20.278938+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.920 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.721 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.861 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.163 | 4218 |
| us-east-2 | 0.163 | 1397 |
| us-gov-east-1 | 0.155 | 1530 |
| us-gov-west-1 | 0.193 | 170 |
| us-west-1 | 0.158 | 3172 |
| us-west-2 | 0.195 | 140 |

