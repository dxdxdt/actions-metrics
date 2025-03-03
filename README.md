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
Updated: 2025-03-03T15:13:05.255464+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.829 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.736 |  |
| ap-south-1 | 0.830 |  |
| ap-southeast-1 | 0.903 |  |
| ap-southeast-2 | 0.778 |  |
| ca-central-1 | 0.101 | 6 |
| eu-central-1 | 0.391 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.416 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.362 |  |
| me-south-1 | 0.748 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.053 | 1163 |
| us-east-2 | 0.099 | 285 |
| us-gov-east-1 | 0.099 | 290 |
| us-gov-west-1 | 0.319 | 1 |
| us-west-1 | 0.274 | 776 |
| us-west-2 | 0.327 |  |

