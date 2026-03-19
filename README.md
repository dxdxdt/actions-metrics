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
Updated: 2026-03-19T05:53:54.261750+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.771 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.074 | 4309 |
| us-east-2 | 0.077 | 1435 |
| us-gov-east-1 | 0.085 | 1586 |
| us-gov-west-1 | 0.284 | 189 |
| us-west-1 | 0.232 | 3253 |
| us-west-2 | 0.278 | 148 |

