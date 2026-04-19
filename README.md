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
Updated: 2026-04-19T04:47:18.485932+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.950 |  |
| ap-south-2 | 0.981 |  |
| ap-southeast-1 | 0.771 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.753 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.199 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.159 | 4524 |
| us-east-2 | 0.153 | 1513 |
| us-gov-east-1 | 0.131 | 1656 |
| us-gov-west-1 | 0.189 | 194 |
| us-west-1 | 0.134 | 3438 |
| us-west-2 | 0.192 | 156 |

