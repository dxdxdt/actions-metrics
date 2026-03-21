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
Updated: 2026-03-21T21:18:25.274691+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.846 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.445 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.079 | 4323 |
| us-east-2 | 0.092 | 1446 |
| us-gov-east-1 | 0.091 | 1594 |
| us-gov-west-1 | 0.261 | 189 |
| us-west-1 | 0.245 | 3274 |
| us-west-2 | 0.260 | 151 |

