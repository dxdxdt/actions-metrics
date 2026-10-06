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
Updated: 2026-10-06T20:42:19.489425+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.170 | 18 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.123 | 5139 |
| us-east-2 | 0.144 | 1690 |
| us-gov-east-1 | 0.142 | 1934 |
| us-gov-west-1 | 0.236 | 237 |
| us-west-1 | 0.181 | 4159 |
| us-west-2 | 0.237 | 193 |

