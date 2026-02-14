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
Updated: 2026-02-14T17:20:33.151799+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.698 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.455 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.080 | 4121 |
| us-east-2 | 0.066 | 1340 |
| us-gov-east-1 | 0.066 | 1466 |
| us-gov-west-1 | 0.243 | 147 |
| us-west-1 | 0.259 | 3059 |
| us-west-2 | 0.244 | 125 |

