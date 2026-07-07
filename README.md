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
Updated: 2026-07-07T18:56:31.032315+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.741 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.892 |  |
| ap-southeast-2 | 0.779 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.912 |  |
| ap-southeast-6 | 0.814 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.062 | 4832 |
| us-east-2 | 0.110 | 1655 |
| us-gov-east-1 | 0.107 | 1729 |
| us-gov-west-1 | 0.300 | 201 |
| us-west-1 | 0.254 | 3753 |
| us-west-2 | 0.302 | 164 |

