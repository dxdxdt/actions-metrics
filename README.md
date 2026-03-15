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
Updated: 2026-03-15T14:23:59.399565+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.626 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.711 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.844 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.173 | 4283 |
| us-east-2 | 0.186 | 1424 |
| us-gov-east-1 | 0.166 | 1577 |
| us-gov-west-1 | 0.174 | 185 |
| us-west-1 | 0.152 | 3236 |
| us-west-2 | 0.175 | 148 |

