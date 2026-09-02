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
Updated: 2026-09-02T23:43:56.765690+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.146 | 18 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.081 | 5080 |
| us-east-2 | 0.102 | 1685 |
| us-gov-east-1 | 0.112 | 1892 |
| us-gov-west-1 | 0.276 | 230 |
| us-west-1 | 0.226 | 4076 |
| us-west-2 | 0.283 | 191 |

