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
Updated: 2026-02-14T22:16:18.431424+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.663 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.870 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.802 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.125 | 4122 |
| us-east-2 | 0.092 | 1341 |
| us-gov-east-1 | 0.095 | 1468 |
| us-gov-west-1 | 0.216 | 147 |
| us-west-1 | 0.224 | 3060 |
| us-west-2 | 0.213 | 125 |

