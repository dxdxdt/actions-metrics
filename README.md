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
Updated: 2026-09-18T19:21:46.919518+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.870 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.125 | 18 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.451 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.088 | 5105 |
| us-east-2 | 0.107 | 1686 |
| us-gov-east-1 | 0.103 | 1916 |
| us-gov-west-1 | 0.270 | 234 |
| us-west-1 | 0.217 | 4125 |
| us-west-2 | 0.267 | 192 |

