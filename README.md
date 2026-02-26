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
Updated: 2026-02-26T19:39:15.921734+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.741 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.095 | 4190 |
| us-east-2 | 0.138 | 1381 |
| us-gov-east-1 | 0.131 | 1512 |
| us-gov-west-1 | 0.273 | 162 |
| us-west-1 | 0.216 | 3125 |
| us-west-2 | 0.273 | 132 |

