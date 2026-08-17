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
Updated: 2026-08-17T05:28:39.279422+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.775 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.153 | 18 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.101 | 5011 |
| us-east-2 | 0.122 | 1680 |
| us-gov-east-1 | 0.120 | 1835 |
| us-gov-west-1 | 0.262 | 224 |
| us-west-1 | 0.206 | 3973 |
| us-west-2 | 0.261 | 180 |

