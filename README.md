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
Updated: 2026-03-23T20:31:27.206804+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.463 |  |
| eu-north-1 | 0.484 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.090 | 4341 |
| us-east-2 | 0.110 | 1449 |
| us-gov-east-1 | 0.111 | 1597 |
| us-gov-west-1 | 0.262 | 190 |
| us-west-1 | 0.244 | 3288 |
| us-west-2 | 0.261 | 151 |

