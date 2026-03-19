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
Updated: 2026-03-19T04:15:46.415222+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.870 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.890 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.281 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.734 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.064 | 4309 |
| us-east-2 | 0.092 | 1434 |
| us-gov-east-1 | 0.108 | 1586 |
| us-gov-west-1 | 0.299 | 189 |
| us-west-1 | 0.243 | 3253 |
| us-west-2 | 0.301 | 148 |

